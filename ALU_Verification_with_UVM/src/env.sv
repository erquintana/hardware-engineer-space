class env extends uvm_env
    `uvm_component_utils(env);


    // Class constructor:
    function void new(string name, uvm_object parent);
        super.new(name, parent);
    endfunction

    // build phase
    function build_phase(uvm_phase phase);
    
    endfunction

    function connect_phase(uvm_phase phase);
        
    endfunction
endclass