class test extends uvm_test;
  `uvm_component_utils(test);

    driver drv;
    sequencer seqr;
    alu_sum_seq sum_test_seq;
    alu_sub_seq sub_test_seq;
    alu_mult_seq mult_test_seq;
    alu_div_seq div_test_seq;
    alu_random_seq random_test_seq;


    // class constructor:
  function new(string name = "test", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info(this.get_name(),"test instance created", UVM_MEDIUM);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
    	`uvm_info(this.get_name(), "build_phase task started", UVM_MEDIUM);
        drv = driver::type_id::create("drv", this);
        seqr = sequencer::type_id::create("seqr", this);
        // test sequences:
        sum_test_seq = alu_sum_seq::type_id::create("sum_test_seq", this);
        sub_test_seq = alu_sub_seq::type_id::create("sub_test_seq", this);
        mult_test_seq = alu_mult_seq::type_id::create("mult_test_seq", this);
        div_test_seq = alu_div_seq::type_id::create("div_test_seq", this);
        random_test_seq = alu_random_seq::type_id::create("random_test_seq", this);
    	`uvm_info(this.get_name(), "build_phase task finished", UVM_MEDIUM);
    endfunction

    function void connect_phase(uvm_phase phase);
    	`uvm_info(this.get_name(), "connect_phase task started", UVM_MEDIUM);
        drv.seq_item_port.connect(seqr.seq_item_export);
      if(! uvm_config_db #(virtual alu_interface.mp_if)::get(this, "", "ALU_vif",drv.ALU_vif)) begin
            `uvm_error("connect", "ALU_vif not found");
        end
    	`uvm_info(this.get_name(), "connect_phase task finished", UVM_MEDIUM);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this, "starting *_test_seq");
    	`uvm_info(this.get_name(), "sum_test_seq task IP", UVM_MEDIUM);
        sum_test_seq.start(seqr);
    	`uvm_info(this.get_name(), "sub_test_seq task IP", UVM_MEDIUM);
        sub_test_seq.start(seqr);
    	`uvm_info(this.get_name(), "mult_test_se task IP", UVM_MEDIUM);
        mult_test_seq.start(seqr);
    	`uvm_info(this.get_name(), "div_test_seq task IP", UVM_MEDIUM);
        div_test_seq.start(seqr);
        `uvm_info(this.get_name(), "random_test_seq task IP", UVM_MEDIUM);
        random_test_seq.start(seqr);
        phase.drop_objection(this, "finished *_test_seq");
    endtask
endclass