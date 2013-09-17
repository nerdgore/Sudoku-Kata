Sudoku = require "../Sudoku"

describe "The Sudoku", ->
  it "should be defined", ->
    (Sudoku).should.be.ok
  
  describe "addNumberToGrid", ->
    it "should add a number to an emtpy grid", ->
      sudoku = new Sudoku
      (sudoku.addNumberToGrid(x:1, y:1, 1)).should.be.truthy
  
    