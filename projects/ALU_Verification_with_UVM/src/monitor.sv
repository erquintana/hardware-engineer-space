class monitor extends uvm_monitor;
    `uvm_component_utils(monitor);


    // Class constructor:
    function void new(string name, uvm_object parent);
        super.new(name);
    endfunction

    // build phase
    function build_phase(uvm_phase phase);
    
    endfunction

endclass