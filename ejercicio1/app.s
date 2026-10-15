.globl app                       // Permite que main.s encuentre el inicio del programa.
app:                             // Inicio del dibujo.
    // X0 conserva la direccion base del framebuffer.
    // X1 = x, X2 = y, X3 = ancho, X4 = alto, W5 = color RGB565.
    // Fondo de toda la pantalla.
    mov x1, 0                    // Posicion horizontal del borde izquierdo: 0.
    mov x2, 0                    // Posicion vertical del borde superior: 0.
    mov x3, 512                  // Ancho: 512 pixeles.
    mov x4, 512                  // Alto: 512 pixeles.
    mov w5, 0xEF3B               // Elige beige para el fondo.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    // Paredes: recorrido similar al ejemplo de la guia.
    mov w5, 0x2104               // Elige gris oscuro para paredes y personaje.
    mov x1, 16                   // Posicion horizontal del borde izquierdo: 16.
    mov x2, 16                   // Posicion vertical del borde superior: 16.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 248                  // Posicion horizontal del borde izquierdo: 248.
    mov x2, 16                   // Posicion vertical del borde superior: 16.
    mov x3, 248                  // Ancho: 248 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 16                   // Posicion horizontal del borde izquierdo: 16.
    mov x2, 16                   // Posicion vertical del borde superior: 16.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 480                  // Alto: 480 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 488                  // Posicion horizontal del borde izquierdo: 488.
    mov x2, 16                   // Posicion vertical del borde superior: 16.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 480                  // Alto: 480 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 16                   // Posicion horizontal del borde izquierdo: 16.
    mov x2, 488                  // Posicion vertical del borde superior: 488.
    mov x3, 248                  // Ancho: 248 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 328                  // Posicion horizontal del borde izquierdo: 328.
    mov x2, 488                  // Posicion vertical del borde superior: 488.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 96                   // Posicion horizontal del borde izquierdo: 96.
    mov x2, 16                   // Posicion vertical del borde superior: 16.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 88                   // Alto: 88 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 176                  // Posicion horizontal del borde izquierdo: 176.
    mov x2, 96                   // Posicion vertical del borde superior: 96.
    mov x3, 320                  // Ancho: 320 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 256                  // Posicion horizontal del borde izquierdo: 256.
    mov x2, 96                   // Posicion vertical del borde superior: 96.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 88                   // Alto: 88 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 16                   // Posicion horizontal del borde izquierdo: 16.
    mov x2, 176                  // Posicion vertical del borde superior: 176.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 336                  // Posicion horizontal del borde izquierdo: 336.
    mov x2, 176                  // Posicion vertical del borde superior: 176.
    mov x3, 88                   // Ancho: 88 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 416                  // Posicion horizontal del borde izquierdo: 416.
    mov x2, 176                  // Posicion vertical del borde superior: 176.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 88                   // Alto: 88 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 256                  // Posicion horizontal del borde izquierdo: 256.
    mov x2, 256                  // Posicion vertical del borde superior: 256.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 256                  // Posicion horizontal del borde izquierdo: 256.
    mov x2, 256                  // Posicion vertical del borde superior: 256.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 240                  // Alto: 240 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 96                   // Posicion horizontal del borde izquierdo: 96.
    mov x2, 256                  // Posicion vertical del borde superior: 256.
    mov x3, 88                   // Ancho: 88 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 176                  // Posicion horizontal del borde izquierdo: 176.
    mov x2, 256                  // Posicion vertical del borde superior: 256.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 88                   // Alto: 88 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 16                   // Posicion horizontal del borde izquierdo: 16.
    mov x2, 336                  // Posicion vertical del borde superior: 336.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 96                   // Posicion horizontal del borde izquierdo: 96.
    mov x2, 408                  // Posicion vertical del borde superior: 408.
    mov x3, 168                  // Ancho: 168 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 336                  // Posicion horizontal del borde izquierdo: 336.
    mov x2, 336                  // Posicion vertical del borde superior: 336.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 160                  // Alto: 160 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 336                  // Posicion horizontal del borde izquierdo: 336.
    mov x2, 336                  // Posicion vertical del borde superior: 336.
    mov x3, 88                   // Ancho: 88 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 416                  // Posicion horizontal del borde izquierdo: 416.
    mov x2, 336                  // Posicion vertical del borde superior: 336.
    mov x3, 8                    // Ancho: 8 pixeles.
    mov x4, 88                   // Alto: 88 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    // Personaje: cuerpo azul, brazos celestes y piernas verdes.
    mov w5, 0x001F               // Elige azul para el cuerpo.
    mov x1, 47                   // Posicion horizontal del borde izquierdo: 47.
    mov x2, 76                   // Posicion vertical del borde superior: 76.
    mov x3, 20                   // Ancho: 20 pixeles.
    mov x4, 20                   // Alto: 20 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov w5, 0x867D               // Elige celeste para ambos brazos.
    mov x1, 41                   // Posicion horizontal del borde izquierdo: 41.
    mov x2, 78                   // Posicion vertical del borde superior: 78.
    mov x3, 4                    // Ancho: 4 pixeles.
    mov x4, 16                   // Alto: 16 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 69                   // Posicion horizontal del borde izquierdo: 69.
    mov x2, 78                   // Posicion vertical del borde superior: 78.
    mov x3, 4                    // Ancho: 4 pixeles.
    mov x4, 16                   // Alto: 16 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov w5, 0x07E0               // Elige verde para ambas piernas.
    mov x1, 48                   // Posicion horizontal del borde izquierdo: 48.
    mov x2, 98                   // Posicion vertical del borde superior: 98.
    mov x3, 6                    // Ancho: 6 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 60                   // Posicion horizontal del borde izquierdo: 60.
    mov x2, 98                   // Posicion vertical del borde superior: 98.
    mov x3, 6                    // Ancho: 6 pixeles.
    mov x4, 8                    // Alto: 8 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    // Cabeza circular clara: X1, X2 = centro; X3 = radio.
    mov x1, 57                   // Posicion horizontal del centro: 57.
    mov x2, 65                   // Posicion vertical del centro: 65.
    mov x3, 12                   // Radio: 12 pixeles.
    mov w5, 0xFF59               // Elige crema para la cabeza.
    bl circulo                   // Dibuja la cabeza y luego vuelve aqui.

    // Sombrero triangular: X1, X2 = vertice; X3 = altura.
    mov x1, 57                   // Posicion horizontal del vertice: 57.
    mov x2, 38                   // Posicion vertical del vertice: 38.
    mov x3, 18                   // Altura: 18 pixeles.
    mov w5, 0xF800               // Elige rojo para el gorro.
    bl triangulo                 // Dibuja el sombrero y luego vuelve aqui.

    // Ojos.
    mov w5, 0x0000               // Elige negro para ambos ojos.
    mov x1, 51                   // Posicion horizontal del borde izquierdo: 51.
    mov x2, 63                   // Posicion vertical del borde superior: 63.
    mov x3, 3                    // Ancho: 3 pixeles.
    mov x4, 3                    // Alto: 3 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    mov x1, 61                   // Posicion horizontal del borde izquierdo: 61.
    mov x2, 63                   // Posicion vertical del borde superior: 63.
    mov x3, 3                    // Ancho: 3 pixeles.
    mov x4, 3                    // Alto: 3 pixeles.
    bl rectangulo                // Dibuja el rectangulo y luego vuelve aqui.

    // La imagen queda estatica mientras la placa este encendida.
InfLoop:                         // Punto al que vuelve el bucle infinito.
    b InfLoop                    // Repite este salto para conservar la imagen.

// Rectangulo relleno. No modifica X0-X5.
// Temporales: X9-X12. Coordenadas y dimensiones dentro de la pantalla.
rectangulo:                      // Inicio del procedimiento para dibujar rectangulos.
    lsl x9, x2, 9                // Calcula y * 512: pixeles de las filas anteriores.
    add x9, x9, x1               // Suma x para ubicar el primer pixel.
    lsl x9, x9, 1                // Multiplica por 2: cada pixel ocupa 2 bytes.
    add x9, x0, x9               // Obtiene la direccion del primer pixel.
    mov x10, x4                  // Guarda cuantas filas faltan pintar.
rect_fila:                       // Prepara una fila del rectangulo.
    mov x11, x3                  // Guarda cuantos pixeles faltan en esta fila.
    mov x12, x9                  // Apunta al inicio de la fila.
rect_pixel:                      // Pinta los pixeles de la fila.
    sturh w5, [x12]              // Escribe el color de 16 bits en el pixel.
    add x12, x12, 2              // Avanza al pixel de la derecha.
    sub x11, x11, 1              // Descuenta un pixel pendiente.
    cbnz x11, rect_pixel         // Si faltan pixeles, sigue pintando la fila.
    add x9, x9, 1024             // Baja una fila: 512 pixeles de 2 bytes.
    sub x10, x10, 1              // Descuenta una fila pendiente.
    cbnz x10, rect_fila          // Si faltan filas, prepara la siguiente.
    br x30                       // Vuelve a la instruccion que sigue al BL.

// Circulo relleno: dx*dx + dy*dy <= radio*radio.
// No modifica X0-X5. Temporales: X9-X15.
circulo:                         // Inicio del procedimiento para dibujar circulos.
    mul x13, x3, x3              // Calcula el radio al cuadrado.
    sub x9, xzr, x3              // Empieza en dy = -radio; XZR vale cero.
circ_fila:                       // Comienza una fila del circulo.
    sub x10, xzr, x3             // Empieza en dx = -radio.
circ_pixel:                      // Comprueba si este pixel pertenece al circulo.
    mul x11, x9, x9              // Calcula dy al cuadrado.
    mul x12, x10, x10            // Calcula dx al cuadrado.
    add x11, x11, x12            // Suma dx al cuadrado y dy al cuadrado.
    subs xzr, x11, x13           // Compara esa suma con el radio al cuadrado.
    b.gt circ_siguiente          // Si esta fuera del circulo, no lo pinta.
    add x14, x2, x9              // Calcula y del pixel: centro Y + dy.
    lsl x14, x14, 9              // Multiplica y por los 512 pixeles de cada fila.
    add x15, x1, x10             // Calcula x del pixel: centro X + dx.
    add x14, x14, x15            // Obtiene el numero de pixel: y * 512 + x.
    lsl x14, x14, 1              // Convierte el numero de pixel a bytes.
    add x14, x0, x14             // Obtiene la direccion del pixel en memoria.
    sturh w5, [x14]              // Pinta el pixel con el color elegido.
circ_siguiente:                  // Avanza al siguiente pixel del circulo.
    add x10, x10, 1              // Avanza una columna: dx aumenta en 1.
    subs xzr, x10, x3            // Compara dx con el radio.
    b.le circ_pixel              // Mientras dx no supere el radio, sigue la fila.
    add x9, x9, 1                // Baja una fila: dy aumenta en 1.
    subs xzr, x9, x3             // Compara dy con el radio.
    b.le circ_fila               // Mientras dy no supere el radio, sigue bajando.
    br x30                       // Vuelve a la instruccion que sigue al BL.

// Triangulo relleno: cada fila crece un pixel hacia cada lado.
// No modifica X0-X5. Temporales: X9-X13.
triangulo:                       // Inicio del procedimiento para dibujar triangulos.
    mov x9, 0                    // Empieza en la fila cero, junto al vertice.
tri_fila:                        // Calcula el comienzo y el ancho de una fila.
    add x10, x2, x9              // Calcula y de la fila actual.
    lsl x10, x10, 9              // Calcula y * 512.
    add x10, x10, x1             // Suma la posicion horizontal del vertice.
    sub x10, x10, x9             // Desplaza el inicio hacia la izquierda.
    lsl x10, x10, 1              // Convierte la posicion a bytes.
    add x10, x0, x10             // Obtiene la direccion del inicio de la fila.
    lsl x11, x9, 1               // Calcula el doble del numero de fila.
    add x11, x11, 1              // Ancho de la fila: 2 * fila + 1 pixeles.
tri_pixel:                       // Pinta los pixeles de esta fila.
    sturh w5, [x10]              // Pinta el pixel con el color elegido.
    add x10, x10, 2              // Avanza al pixel de la derecha.
    sub x11, x11, 1              // Descuenta un pixel pendiente.
    cbnz x11, tri_pixel          // Si faltan pixeles, sigue pintando la fila.
    add x9, x9, 1                // Baja a la siguiente fila.
    subs xzr, x9, x3             // Compara las filas dibujadas con la altura.
    b.lt tri_fila                // Si falta altura, dibuja otra fila.
    br x30                       // Vuelve a la instruccion que sigue al BL.


