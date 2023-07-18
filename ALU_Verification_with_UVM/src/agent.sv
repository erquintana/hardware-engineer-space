class agent extends uv_agent
    `uvm_component_utils(agent);


    // Class constructor:
    function void new(string name, uvm_object parent);
        super.new();
    endfunctionn

    // build phase
    function build_phase(uvm_phase phase);
    
    endfunction
endclass