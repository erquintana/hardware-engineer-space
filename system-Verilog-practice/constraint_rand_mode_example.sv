class base1;
    rand bit [3:0] a,b,c,d;

    constraint C1 {a != 10;}
    constraint C2 {b > 5;}

endclass

module tb;
    base1 b1 = new();
    initial begin
        b1.rand_mode(0);
        b1.a.rand_mode(1);
        b1.b.rand_mode(1);
        b1.constraint_mode(0);
        b1.C1.constraint_mode(1);
        if(!b1.randomize()) $display("Randomization error");
    end
endmodule