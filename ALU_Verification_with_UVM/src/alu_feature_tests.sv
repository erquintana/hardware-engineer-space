class alu_sum_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sum_seq);

  // alu_sum_seq to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "alu_sum_seq object created", UVM_MEDIUM);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "pre_body task started", UVM_MEDIUM);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "pre_body task finished", UVM_MEDIUM);
    // setting initial values
    alu_pkt.a   = 0;
    alu_pkt.b   = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "body task started", UVM_MEDIUM);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0000;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d:", i), UVM_MEDIUM);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0, alu_pkt.a);
      finish_item(alu_pkt);
    end
    alu_pkt.print();
    `uvm_info(this.get_name(), "body task finished", UVM_MEDIUM);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "post_body task started", UVM_MEDIUM);
    `uvm_info(this.get_name(), "post_body task finished", UVM_MEDIUM);
  endtask
endclass

class alu_sub_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_sub_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "alu_sub_seq object created", UVM_MEDIUM);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "pre_body task started", UVM_MEDIUM);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "pre_body task finished", UVM_MEDIUM);
    // setting initial values
    alu_pkt.a   = 0;
    alu_pkt.b   = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "body task started", UVM_MEDIUM);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0001;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d:", i), UVM_MEDIUM);

      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0, alu_pkt.a);
      finish_item(alu_pkt);
    end
    alu_pkt.print();
    `uvm_info(this.get_name(), "body task finished", UVM_MEDIUM);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "post_body task started", UVM_MEDIUM);
    `uvm_info(this.get_name(), "post_body task finished", UVM_MEDIUM);
  endtask
endclass

class alu_mult_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_mult_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "alu_mult_seq object created", UVM_MEDIUM);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "pre_body task started", UVM_MEDIUM);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "pre_body task finished", UVM_MEDIUM);
    // setting initial values
    alu_pkt.a   = 0;
    alu_pkt.b   = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "body task started", UVM_MEDIUM);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0010;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d:", i), UVM_MEDIUM);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0, alu_pkt.a);
      finish_item(alu_pkt);
    end
    alu_pkt.print();
    `uvm_info(this.get_name(), "body task finished", UVM_MEDIUM);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "post_body task started", UVM_MEDIUM);
    `uvm_info(this.get_name(), "post_body task finished", UVM_MEDIUM);
  endtask
endclass

class alu_div_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_div_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim

  // Class constructor:
  function new(string name = "alu_sum_seq");
    super.new(name);
    `uvm_info(this.get_name(), "alu_div_seq object created", UVM_MEDIUM);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "pre_body task started", UVM_MEDIUM);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "pre_body task finished", UVM_MEDIUM);
    // setting initial values
    alu_pkt.a   = 0;
    alu_pkt.b   = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "body task started", UVM_MEDIUM);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    alu_pkt.alu_sel = 4'b0011;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d:", i), UVM_MEDIUM);
      alu_pkt.rst = $urandom();
      alu_pkt.a   = $urandom();
      alu_pkt.b   = $urandom_range(0, alu_pkt.a);
      finish_item(alu_pkt);
    end
    alu_pkt.print();
    `uvm_info(this.get_name(), "body task finished", UVM_MEDIUM);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "post_body task started", UVM_MEDIUM);
    `uvm_info(this.get_name(), "post_body task finished", UVM_MEDIUM);
  endtask
endclass

class alu_random_seq extends uvm_sequence #(alu_seq_packet);
  `uvm_object_utils(alu_random_seq);

  // Packet to be sent to DUT (ALU) in the sequence:
  alu_seq_packet alu_pkt;
  rand int pkt_qty = 15;  // qty packets to be sent during sim 

  // Class constructor:
  function new(string name = "alu_random_seq");
    super.new(name);
    `uvm_info(this.get_name(), "alu_random_seq object created", UVM_MEDIUM);
  endfunction

  // Pre body task to intilize variables and rst change:
  task pre_body();
    `uvm_info(this.get_name(), "pre_body task started", UVM_MEDIUM);
    alu_pkt = alu_seq_packet::type_id::create("alu_pkt");
    `uvm_info(this.get_name(), "pre_body task finished", UVM_MEDIUM);
    // setting initial values
    alu_pkt.a   = 0;
    alu_pkt.b   = 0;
    alu_pkt.rst = 0;
  endtask

  // Task to assign the rand data fields:
  task body;
    `uvm_info(this.get_name(), "body task started", UVM_MEDIUM);
    // iterating pkt_qty times for a and b randomize:
    #10;
    alu_pkt.rst = 1;
    #20;
    alu_pkt.rst = 0;
    for (int i = 0; i < pkt_qty; ++i) begin
      start_item(alu_pkt);
      `uvm_info("", $sformatf("Random pkt #%d:", i), UVM_MEDIUM);
      alu_pkt.rst = $urandom();
      alu_pkt.a = $urandom();
      alu_pkt.b = $urandom_range(0, alu_pkt.a);
      alu_pkt.alu_sel = $urandom_range(0, 4);
      finish_item(alu_pkt);
    end
    alu_pkt.print();
    `uvm_info(this.get_name(), "body task finished", UVM_MEDIUM);
  endtask

  task post_body();
    `uvm_info(this.get_name(), "post_body task started", UVM_MEDIUM);
    `uvm_info(this.get_name(), "post_body task finished", UVM_MEDIUM);
  endtask
endclass

