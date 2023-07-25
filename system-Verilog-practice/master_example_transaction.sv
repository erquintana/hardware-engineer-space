class base_transaction;
  logic clk;
  logic rst;

  function new(logic clk = 0, logic rst = 0);
    this.clk = clk;
    this.rst = rst;
  endfunction

  function void print();
    $display("[TR_prt] : clk = %0b  |  rst = %0b", this.clk, this.rst);
  endfunction

  virtual function void test();
    $display("PARENT CLASS TEST");
  endfunction
endclass

class transaction extends base_transaction;
  logic clk;
  logic rst;
  rand logic rd_en;
  rand logic wr_en;
  rand int rd_addr = 0;
  rand int wr_addr;
  static int static_int;

  //constraint wr_rd_constr {wr_en != rd_en;};
  constraint rd_addr_constr {rd_addr inside {[0 : 5]};}
  ;
  constraint wr_addr_constr {wr_addr inside {[0 : 5]};}
  ;
  constraint wr_rd_adrr_constr {wr_addr != rd_addr;}
  ;


  function new(logic clk = 0, logic rst = 0);
    super.new();
    this.clk   = clk;
    this.rst   = rst;
    this.rd_en = $urandom();
    this.wr_en = $urandom();
  endfunction

  function void print();
    $display(
        "[TR] : clk = %0b  |  rst = %0b  |  rd_en = %0b  |  wr_en = %0b  |  rd_addr = %0d  |  wr_addr = %0d ",
        this.clk, this.rst, this.rd_en, this.wr_en, this.rd_addr, this.wr_addr);
  endfunction

  static function void incr_static_int();
    static_int++;
  endfunction


  function void test();
    $display("CHILD CLASS TEST");
  endfunction
endclass


module tb;
  event static_array_transaction;
  event dynamic_array_transaction;
  event assoc_array_transaction;
  event queue_transaction;

  // single object
  initial begin
    transaction tr = new();
    $display("\n=========================================================");
    $display("\tSINGLE OBJECT OF TRANSACTION CLASS");
    tr.randomize();
    a1 : assert (tr.wr_en != tr.rd_en);
    tr.print();
    ->static_array_transaction;
  end

  // static array
  initial begin
    transaction tr_stc_array[5];
    $display("\n=========================================================");
    $display("\tSTATIC ARRAY OF TRANSACTION CLASS");
    wait (static_array_transaction.triggered);

    foreach (tr_stc_array[i]) begin
      tr_stc_array[i] = new();
      tr_stc_array[i].randomize();
      tr_stc_array[i].print();
    end
  end

  // dynamic array
  initial begin
    transaction tr_dyn_array[];
    tr_dyn_array = new[5];
    $display("\n=========================================================");
    $display("\tDYNAMIC ARRAY OF TRANSACTION CLASS");
    foreach (tr_dyn_array[i]) begin
      tr_dyn_array[i] = new();
      tr_dyn_array[i].randomize();
      tr_dyn_array[i].print();
    end

    $display("\tExtending tr_dyn_array to 7 elements");
    tr_dyn_array = new[7] (tr_dyn_array);
    tr_dyn_array[5] = new();
    tr_dyn_array[5].randomize();
    tr_dyn_array[5].print();
    tr_dyn_array[6] = new();
    tr_dyn_array[6].randomize();
    tr_dyn_array[6].print();
  end

  // assoc array
  initial begin
    typedef enum {
      TX,
      RX,
      STD
    } assoc_trs;
    transaction tr_assoc_array[assoc_trs];
    $display("\n=========================================================");
    $display("\tASSOCIATIVE ARRAY OF TRANSACTION CLASS");
    tr_assoc_array[TX]  = new();
    tr_assoc_array[RX]  = new();
    tr_assoc_array[STD] = new();

    foreach (tr_assoc_array[i]) begin
      tr_assoc_array[i].randomize();
      tr_assoc_array[i].print();
    end
  end

  // queue
  initial begin
    transaction tr_queue[$];
    $display("\n=========================================================");
    $display("\tQUEUE OF TRANSACTION CLASS");

    for (int i = 0; i < 5; i++) begin
      transaction trq = new();
      tr_queue.push_front(trq);
    end

    foreach (tr_queue[i]) begin
      tr_queue[i].randomize();
      tr_queue[i].print();
    end
  end

  // queue from parent handle
  initial begin
    base_transaction tr_queue[$];
    $display("\n=========================================================");
    $display("\tQUEUE OF TRANSACTION CLASS - PARENT");

    for (int i = 0; i < 5; i++) begin
      transaction trq = new();
      base_transaction tr_parent;
      tr_parent = trq;
      tr_queue.push_front(tr_parent);
    end

    foreach (tr_queue[i]) begin
      tr_queue[i].randomize();
      tr_queue[i].print();
    end
  end

  // static methods/properties
  initial begin
    transaction tr_static_test;
    $display("\n=========================================================");
    $display("\tSTATIC METHOS AND FUNCTIONS");
    repeat (5) begin
      $display("static propertie: %0d", tr_static_test.static_int);
      tr_static_test.incr_static_int();
    end

  end

  initial begin
    base_transaction b = new();
    transaction t1, t2;
    $display("\n=========================================================");
    $display("\tCAST OBJECTS");
    //$cast(t1, b);
    t1.test();
  end
endmodule
