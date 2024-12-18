#include "vbuddy.cpp"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vsinegen.h"

int main(int argc, char **argv, char **env) {
    int i;
    int j;

    Verilated::commandArgs(argc, argv);

    Vsinegen* top = new Vsinegen;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("sinegen.vcd");

    if (vbdOpen() !=1) return(-1);
    vbdHeader("Lab2 - Task 2");

    top->clk = 1;
    top->en = 1;
    top->rst = 0;
    top->incr = 1;

    for(i=0; i<240; i++) {
        
        for(j=0; j<2; j++) {
            tfp->dump(2*i+j);
            top->clk = !top->clk;
            top->eval();
        }

        top->incr = 1;
        top->offset = vbdValue();

        vbdPlot(int(top->dout1), 0, 255);
        vbdPlot(int(top->dout2), 0, 255);
        vbdCycle(i);

        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
        exit(0);                // ... exit if finish OR 'q' pressed

    }
}