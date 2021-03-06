require_relative '../lib/interface'

describe "interface" do
let(:intf){Interface.new}

    it "set a new board for the user to play" do
        expect(intf.board).to eq({
            [1, 1]=>" # ", [2, 1]=>" # ", [3, 1]=>" # ", [4, 1]=>" # ", [5, 1]=>" # ",
            [6, 1]=>" # ", [7, 1]=>" # ", [8, 1]=>" # ", [9, 1]=>" # ", [10, 1]=>" # ",
            [1, 2]=>" # ", [2, 2]=>" # ", [3, 2]=>" # ", [4, 2]=>" # ", [5, 2]=>" # ",
            [6, 2]=>" # ", [7, 2]=>" # ", [8, 2]=>" # ", [9, 2]=>" # ", [10, 2]=>" # ",
            [1, 3]=>" # ", [2, 3]=>" # ", [3, 3]=>" # ", [4, 3]=>" # ", [5, 3]=>" # ",
            [6, 3]=>" # ", [7, 3]=>" # ", [8, 3]=>" # ", [9, 3]=>" # ", [10, 3]=>" # ",
            [1, 4]=>" # ", [2, 4]=>" # ", [3, 4]=>" # ", [4, 4]=>" # ", [5, 4]=>" # ",
            [6, 4]=>" # ", [7, 4]=>" # ", [8, 4]=>" # ", [9, 4]=>" # ", [10, 4]=>" # ",
            [1, 5]=>" # ", [2, 5]=>" # ", [3, 5]=>" # ", [4, 5]=>" # ", [5, 5]=>" # ",
            [6, 5]=>" # ", [7, 5]=>" # ", [8, 5]=>" # ", [9, 5]=>" # ", [10, 5]=>" # ",
            [1, 6]=>" # ", [2, 6]=>" # ", [3, 6]=>" # ", [4, 6]=>" # ", [5, 6]=>" # ",
            [6, 6]=>" # ", [7, 6]=>" # ", [8, 6]=>" # ", [9, 6]=>" # ", [10, 6]=>" # ",
            [1, 7]=>" # ", [2, 7]=>" # ", [3, 7]=>" # ", [4, 7]=>" # ", [5, 7]=>" # ",
            [6, 7]=>" # ", [7, 7]=>" # ", [8, 7]=>" # ", [9, 7]=>" # ", [10, 7]=>" # ",
            [1, 8]=>" # ", [2, 8]=>" # ", [3, 8]=>" # ", [4, 8]=>" # ", [5, 8]=>" # ",
            [6, 8]=>" # ", [7, 8]=>" # ", [8, 8]=>" # ", [9, 8]=>" # ", [10, 8]=>" # ",
            [1, 9]=>" # ", [2, 9]=>" # ", [3, 9]=>" # ", [4, 9]=>" # ", [5, 9]=>" # ",
            [6, 9]=>" # ", [7, 9]=>" # ", [8, 9]=>" # ", [9, 9]=>" # ", [10, 9]=>" # ",
            [1, 10]=>" # ", [2, 10]=>" # ", [3, 10]=>" # ", [4, 10]=>" # ", [5, 10]=>" # ",
            [6, 10]=>" # ", [7, 10]=>" # ", [8, 10]=>" # ", [9, 10]=>" # ", [10, 10]=>" # "})
    end
    
    #it "has 2 models to decide click or put flag" do
    #end
    
    it "mark the square when puts flag" do
        intf.flag([10, 6])
        expect(intf.board[[10, 6]]).to eq(" F ")
    end
    
    it "transfer square into testbench to compare" do
        intf.godset
        allow(intf.click([10, 6])).to receive(:dig).and_return(true)
        intf.click([10, 6])
    end
    
    it "has a god model to display the answer" do
        intf.godset
    end
    
    it "test under many cases with a godset control" do
        intf.godset
        intf.display(intf.board)
        intf.click([2, 2])
        intf.flag([4, 1])
        intf.flag([4, 4])
        intf.flag([1, 7])
    end
let(:caselose){{
    [1, 1]=>" O ", [1, 2]=>" F ",
    [1, 3]=>" K ", [1, 4]=>" 2 ", 
    [1, 5]=>" 1 "}}
    
let(:answer){{
    [1, 1]=>" O ", [1, 2]=>" X ",
    [1, 3]=>" X ", [1, 4]=>" 2 ", 
    [1, 5]=>" 1 "}}

let(:casewin){{
    [1, 1]=>" O ", [1, 2]=>" F ",
    [1, 3]=>" F ", [1, 4]=>" 2 ", 
    [1, 5]=>" 1 "}}
    
    it "tell whether you win or not" do
        expect(intf.compare(casewin, answer)).to eq("you win")
        expect(intf.compare(caselose, answer)).to eq("not win yet")
    end
    
    
end