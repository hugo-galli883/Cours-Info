#include "squelette.c"
#include "TP2.h"
/**/

//Ex4.2
int ex423(){
    for(int i = 0 ; i < WIDTH ; i++) {
        for(int j = 0 ; j < HEIGHT ; j++) {
            put_pixel(i, j, red);
        }
    }
    print_canvas();
    return 0;
}

//Ex5
void draw_h_line(int y, int x0, int x1, rgb c) {
    for(int i = x0 ; i < x1 ; i++) {
        put_pixel(y, i, c);
    }
}

void draw_v_line(int x, int y0, int y1, rgb c) {
    for(int i = y0 ; i < y1 ; i++) {
        put_pixel(i, x, c);
    }
}

void draw_rectangle(int x0, int y0, int x1, int y1, rgb c) {
    draw_v_line(x0, y0, y1, c);
    draw_v_line(x1, y0, y1, c);
    draw_v_line(y0, x0, x1, c);
    draw_v_line(y1, x0, x1, c);
}

void fill_rectangle(int x0, int y0, int x1, int y1, rgb c) {
    for(int i = x0 ; i < x1 ; i++ ) {
        for(int j = y0 ; j < y1 ; j++) {
            put_pixel(i,j,c);
        }
    }
}