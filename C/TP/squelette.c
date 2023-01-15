#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define HEIGHT 2
#define WIDTH 3

typedef int rgb[3];

rgb red = {255, 0, 0};
rgb green = {0, 255, 0};
rgb blue = {0, 0, 255};
rgb black = {0, 0, 0};
rgb white = {255, 255, 255};
rgb lightgray = {150, 150, 150};

rgb canvas[HEIGHT][WIDTH];

void put_pixel(int x, int y, rgb c){
    int i = HEIGHT - 1 - y;
    int j = x;
    if (i < 0 || i >= HEIGHT || j < 0 || j > WIDTH) return;
    for (int k = 0; k < 3; k++){
        canvas[i][j][k] = c[k];
    }
}

/***********************/
/* Création du fichier */
/***********************/

/* Exercice 1 */

void print_canvas(void){
    printf("P3\n");
    printf("%d %d\n", WIDTH, HEIGHT);
    printf("255\n");
    for (int i = 0; i < HEIGHT; i++){
        for (int j = 0; j < WIDTH; j++){
            for (int k = 0; k < 3; k++){
                printf("%d ", canvas[i][j][k]);
            }
            printf("\n");
        }
    }
}



/***********************/
/*  Primitives simples */
/***********************/

/* Exercice 3 */

void draw_h_line(int y, int x0, int x1, rgb c);

void draw_v_line(int x, int y0, int y1, rgb c);


/* Exercice 4 */

void draw_rectangle(int xmin, int ymin, int xmax, int ymax, rgb c);

void fill_rectangle(int xmin, int ymin, int xmax, int ymax, rgb c);


/* Exercice 5 */

void fill_disk(int xc, int yc, int radius, rgb c);



/***********************/
/* Mélange de couleurs */
/***********************/

/* Exercice 6 */

int clamp(double x);

void mix(rgb c0, rgb c1, double alpha, double beta, rgb result);


/* Exercice 7 */

void draw_h_gradient(int y, int x0, int x1, rgb c0, rgb c1);

void fill_disk_gradient(int xc, int yc, int radius, rgb c_center, rgb c_edge);


/* Exercice 8 */

void get_pixel(int x, int y, rgb result);

void mix_pixel(int x, int y, double alpha, double beta, rgb c);

void add_disk(int xc, int yc, int radius, rgb c);



/*******************/
/* Tracé de lignes */
/*******************/

/* Exercice 9 */

void draw_line(int x0, int y0, int x1, int y1, rgb c);


/* Exercice 10 */

void draw_spokes(int xc, int yc, int radius, int nb_spokes, rgb c);


/* Exercice 11 */

void bresenham_low(int x0, int y0, int x1, int y1, rgb c);

void bresenham_high(int x0, int y0, int x1, int y1, rgb c);

void bresenham(int x0, int y0, int x1, int y1, rgb c);


/* Exercice 12 */

void draw_circle(int xc, int yc, int radius, rgb c);


/*****************/
/* Fonction main */
/*****************/

int main(void){
    put_pixel(0, 0, green);
    put_pixel(1, 0, white);
    put_pixel(2, 0, lightgray);
    put_pixel(0, 1, red);
    put_pixel(1, 1, red);
    put_pixel(2, 1, blue);
    print_canvas();
}
