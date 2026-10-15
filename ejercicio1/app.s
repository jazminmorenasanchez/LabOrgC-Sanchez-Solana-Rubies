.globl app
app:
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

    // Personaje: cuerpo, brazos y piernas oscuros.
    mov x1, 47
    mov x2, 76
    mov x3, 20
    mov x4, 20
    bl rectangulo

    mov x1, 41
    mov x2, 78
    mov x3, 4
    mov x4, 16
    bl rectangulo

    mov x1, 69
    mov x2, 78
    mov x3, 4
    mov x4, 16
    bl rectangulo

    mov x1, 48
    mov x2, 98
    mov x3, 6
    mov x4, 8
    bl rectangulo

    mov x1, 60
    mov x2, 98
    mov x3, 6
    mov x4, 8
    bl rectangulo

    // Cabeza circular clara: X1, X2 = centro; X3 = radio.
    mov x1, 57
    mov x2, 65
    mov x3, 12
    mov w5, 0xFFFF
    bl circulo

    // Sombrero triangular: X1, X2 = vertice; X3 = altura.
    mov x1, 57
    mov x2, 38
    mov x3, 18
    mov w5, 0x2104
    bl triangulo

    // Ojos.
    mov x1, 51
    mov x2, 63
    mov x3, 3
    mov x4, 3
    bl rectangulo

    mov x1, 61
    mov x2, 63
    mov x3, 3
    mov x4, 3
    bl rectangulo

    // La imagen queda estatica mientras la placa este encendida.
InfLoop:
    b InfLoop

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


