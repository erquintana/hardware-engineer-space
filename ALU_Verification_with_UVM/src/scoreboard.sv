class scoreboard extends uvm_scoreboard
    `uvm_component_utils(scoreboard);


    // Class constructor:
    function void new(string name, uvm_object parent);
        super.new(name, parent);
    endfunction

    // build phase
    function build_phase(uvm_phase phase);
    
    endfunction
endclass