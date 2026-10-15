// GPIO de la foto derecha de la pagina 5.
// Foto izquierda: abajo=18, izquierda=15, derecha=17.
.equ BOTON_ARRIBA,    (1 << 14)
.equ BOTON_ABAJO,     (1 << 17)
.equ BOTON_IZQUIERDA, (1 << 18)
.equ BOTON_DERECHA,   (1 << 15)
.equ GPIO_GPSET0, 0x1C
.equ GPIO_GPCLR0, 0x28

// X23 = base GPIO. Configura solo los pines utilizados.
// LED rojo GPIO3 y verde GPIO2: activos en bajo.
// Temporales X9-X11; conserva X0 y los registros del juego.
.globl configurar_gpio
configurar_gpio:
    mov w23, PERIPHERAL_BASE + GPIO_BASE
    mov w9, 12
    stur w9, [x23, GPIO_GPSET0] // Ambos apagados antes de habilitarlos.
    ldur w9, [x23]
    mov x10, 0xFC0             // Campos de GPIO2 y GPIO3.
    mov x11, 0xFFFFFFFF
    eor x10, x10, x11
    and x9, x9, x10
    mov x10, 0x240
    orr x9, x9, x10          // 001 en ambos campos.
    stur w9, [x23]
    ldur w9, [x23, GPIO_GPFSEL1]
    movz x10, 0xF000
    movk x10, 0x07E3, lsl 16  // Campos GPIO14,15,17,18: 0x07E3F000.
    eor x10, x10, x11
    and x9, x9, x10
    stur w9, [x23, GPIO_GPFSEL1]
    br x30

.globl leer_botones
leer_botones:
    ldur w24, [x23, GPIO_GPLEV0]
    br x30

.globl led_jugando
led_jugando:
    mov w9, 4
    stur w9, [x23, GPIO_GPSET0] // Apagar verde.
    mov w9, 8
    stur w9, [x23, GPIO_GPCLR0] // Encender rojo.
    br x30

.globl led_ganador
led_ganador:
    mov w9, 8
    stur w9, [x23, GPIO_GPSET0]
    mov w9, 4
    stur w9, [x23, GPIO_GPCLR0]
    br x30

.globl apagar_leds
apagar_leds:
    mov w9, 12
    stur w9, [x23, GPIO_GPSET0]
    br x30


