.globl app
app:
    // X19/X20 = esquina superior izquierda del personaje (35 x 68).
    // X21/X22 = posicion propuesta; X23 = GPIO; X24 = botones.
    // X26 = contador del System Timer (manual BCM2835, pp. 172-173).
    bl configurar_gpio
    movz x26, 0x3004
    movk x26, 0x3F00, lsl 16
inicio:
    bl led_jugando
    // X0 conserva la direccion base del framebuffer.
    // X1 = x, X2 = y, X3 = ancho, X4 = alto, W5 = color RGB565.
    // Fondo de toda la pantalla.
    mov x1, 0
    mov x2, 0
    mov x3, 512
    mov x4, 512
    mov w5, 0xEF3B
    bl rectangulo

    // Paredes: recorrido similar al ejemplo de la guia.
    mov w5, 0x2104
    mov x1, 16
    mov x2, 16
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 248
    mov x2, 16
    mov x3, 248
    mov x4, 8
    bl rectangulo

    mov x1, 16
    mov x2, 16
    mov x3, 8
    mov x4, 480
    bl rectangulo

    mov x1, 488
    mov x2, 16
    mov x3, 8
    mov x4, 480
    bl rectangulo

    mov x1, 16
    mov x2, 488
    mov x3, 248
    mov x4, 8
    bl rectangulo

    mov x1, 328
    mov x2, 488
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 96
    mov x2, 16
    mov x3, 8
    mov x4, 88
    bl rectangulo

    mov x1, 176
    mov x2, 96
    mov x3, 320
    mov x4, 8
    bl rectangulo

    mov x1, 256
    mov x2, 96
    mov x3, 8
    mov x4, 88
    bl rectangulo

    mov x1, 16
    mov x2, 176
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 336
    mov x2, 176
    mov x3, 88
    mov x4, 8
    bl rectangulo

    mov x1, 416
    mov x2, 176
    mov x3, 8
    mov x4, 88
    bl rectangulo

    mov x1, 256
    mov x2, 256
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 256
    mov x2, 256
    mov x3, 8
    mov x4, 240
    bl rectangulo

    mov x1, 96
    mov x2, 256
    mov x3, 88
    mov x4, 8
    bl rectangulo

    mov x1, 176
    mov x2, 256
    mov x3, 8
    mov x4, 88
    bl rectangulo

    mov x1, 16
    mov x2, 336
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 96
    mov x2, 408
    mov x3, 168
    mov x4, 8
    bl rectangulo

    mov x1, 336
    mov x2, 336
    mov x3, 8
    mov x4, 160
    bl rectangulo

    mov x1, 336
    mov x2, 336
    mov x3, 88
    mov x4, 8
    bl rectangulo

    mov x1, 416
    mov x2, 336
    mov x3, 8
    mov x4, 88
    bl rectangulo

    bl dibujar_meta
    mov x19, 40
    mov x20, 38
    bl dibujar_personaje

juego:
    bl leer_botones
    mov x21, x19
    mov x22, x20
    // Una direccion por lectura. Prioridad: arriba, abajo, izquierda, derecha.
    and x9, x24, BOTON_ARRIBA
    cbnz x9, arriba
    and x9, x24, BOTON_ABAJO
    cbnz x9, abajo
    and x9, x24, BOTON_IZQUIERDA
    cbnz x9, izquierda
    and x9, x24, BOTON_DERECHA
    cbnz x9, derecha
    b juego
arriba:
    sub x22, x22, 2
    b intentar
abajo:
    add x22, x22, 2
    b intentar
izquierda:
    sub x21, x21, 2
    b intentar
derecha:
    add x21, x21, 2
intentar:
    // Limites: toda la caja del personaje debe quedar en pantalla.
    subs xzr, x21, 0
    b.lt pausa
    subs xzr, x21, 477
    b.gt pausa
    subs xzr, x22, 0
    b.lt pausa
    subs xzr, x22, 444
    b.gt pausa

    // Borrar primero evita confundir el personaje con las paredes oscuras.
    mov x1, x19
    mov x2, x20
    mov x3, 35
    mov x4, 68
    mov w5, 0xEF3B
    bl rectangulo
    bl dibujar_meta
    bl comprobar_pared
    cbnz x6, restaurar_personaje
    mov x19, x21
    mov x20, x22
restaurar_personaje:
    bl dibujar_personaje
    // Ganar al tocar la marca verde en la salida inferior.
    add x9, x19, 17
    subs xzr, x9, 280
    b.lt pausa
    subs xzr, x9, 320
    b.ge pausa
    add x9, x20, 67
    subs xzr, x9, 480
    b.ge victoria
pausa:
    mov x8, 20000 // 20 ms entre intentos; mantener pulsado repite el movimiento.
    bl esperar
    b juego

victoria:
    bl led_ganador
    movz x8, 0xC6C0
    movk x8, 0x2D, lsl 16 // 3.000.000 microsegundos.
    bl esperar
    bl apagar_leds
fin:
    b fin // Juego terminado: la imagen queda visible hasta reiniciar la placa.

// Marca verde dentro de la abertura inferior. Llamada final a rectangulo:
// B conserva X30 y rectangulo retorna directamente al llamador.
dibujar_meta:
    mov x1, 280
    mov x2, 480
    mov x3, 40
    mov x4, 32
    mov w5, 0x07E0
    b rectangulo

// Examina los 35 x 68 pixeles de la posicion propuesta.
// Resultado X6 = 1 si hay pared; 0 si esta libre. Temporales X9-X15.
// El personaje ya esta borrado; solo las paredes tienen color 0x2104.
comprobar_pared:
    mov x6, 0
    lsl x9, x22, 9
    add x9, x9, x21
    lsl x9, x9, 1
    add x9, x0, x9
    mov x10, 68
    mov w15, 0x2104
col_fila:
    mov x11, 35
    mov x12, x9
col_pixel:
    ldurh w13, [x12]
    subs xzr, x13, x15
    b.eq hay_pared
    add x12, x12, 2
    sub x11, x11, 1
    cbnz x11, col_pixel
    add x9, x9, 1024
    sub x10, x10, 1
    cbnz x10, col_fila
    br x30
hay_pared:
    mov x6, 1
    br x30

// X8 = duracion en microsegundos. Temporales W9-W11.
// Resta de 32 bits: funciona incluso si CLO desborda durante la espera.
esperar:
    ldur w9, [x26]
espera_loop:
    ldur w10, [x26]
    sub w11, w10, w9
    subs xzr, x11, x8
    b.lt espera_loop
    br x30

dibujar_personaje:
    mov x27, x30 // Guardar retorno: esta funcion llama a otras.
    mov w5, 0x2104
    // Personaje: cuerpo, brazos y piernas oscuros.
    add x1, x19, 7
    add x2, x20, 38
    mov x3, 20
    mov x4, 20
    bl rectangulo

    add x1, x19, 1
    add x2, x20, 40
    mov x3, 4
    mov x4, 16
    bl rectangulo

    add x1, x19, 29
    add x2, x20, 40
    mov x3, 4
    mov x4, 16
    bl rectangulo

    add x1, x19, 8
    add x2, x20, 60
    mov x3, 6
    mov x4, 8
    bl rectangulo

    add x1, x19, 20
    add x2, x20, 60
    mov x3, 6
    mov x4, 8
    bl rectangulo

    // Cabeza circular clara: X1, X2 = centro; X3 = radio.
    add x1, x19, 17
    add x2, x20, 27
    mov x3, 12
    mov w5, 0xFFFF
    bl circulo

    // Sombrero triangular: X1, X2 = vertice; X3 = altura.
    add x1, x19, 17
    add x2, x20, 0
    mov x3, 18
    mov w5, 0x2104
    bl triangulo

    // Ojos.
    add x1, x19, 11
    add x2, x20, 25
    mov x3, 3
    mov x4, 3
    bl rectangulo

    add x1, x19, 21
    add x2, x20, 25
    mov x3, 3
    mov x4, 3
    bl rectangulo

    br x27

// Rectangulo relleno. No modifica X0-X5.
// Temporales: X9-X12. Coordenadas y dimensiones dentro de la pantalla.
rectangulo:
    lsl x9, x2, 9
    add x9, x9, x1
    lsl x9, x9, 1
    add x9, x0, x9
    mov x10, x4
rect_fila:
    mov x11, x3
    mov x12, x9
rect_pixel:
    sturh w5, [x12]
    add x12, x12, 2
    sub x11, x11, 1
    cbnz x11, rect_pixel
    add x9, x9, 1024
    sub x10, x10, 1
    cbnz x10, rect_fila
    br x30

// Circulo relleno: dx*dx + dy*dy <= radio*radio.
// No modifica X0-X5. Temporales: X9-X15.
circulo:
    mul x13, x3, x3
    sub x9, xzr, x3
circ_fila:
    sub x10, xzr, x3
circ_pixel:
    mul x11, x9, x9
    mul x12, x10, x10
    add x11, x11, x12
    subs xzr, x11, x13
    b.gt circ_siguiente
    add x14, x2, x9
    lsl x14, x14, 9
    add x15, x1, x10
    add x14, x14, x15
    lsl x14, x14, 1
    add x14, x0, x14
    sturh w5, [x14]
circ_siguiente:
    add x10, x10, 1
    subs xzr, x10, x3
    b.le circ_pixel
    add x9, x9, 1
    subs xzr, x9, x3
    b.le circ_fila
    br x30

// Triangulo relleno: cada fila crece un pixel hacia cada lado.
// No modifica X0-X5. Temporales: X9-X13.
triangulo:
    mov x9, 0
tri_fila:
    add x10, x2, x9
    lsl x10, x10, 9
    add x10, x10, x1
    sub x10, x10, x9
    lsl x10, x10, 1
    add x10, x0, x10
    lsl x11, x9, 1
    add x11, x11, 1
tri_pixel:
    sturh w5, [x10]
    add x10, x10, 2
    sub x11, x11, 1
    cbnz x11, tri_pixel
    add x9, x9, 1
    subs xzr, x9, x3
    b.lt tri_fila
    br x30


