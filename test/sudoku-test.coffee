Sudoku = require "sudoku"

describe "Sudoku", ->
  it "should be defined", ->
    (Sudoku).should.be.ok
  
  beforeEach ->
    @sudoku = new Sudoku
  
  describe "addNumberToGrid", ->
    it "should add a number to an emtpy grid", ->
      num = 1
      (@sudoku.addNumberToGrid(x:1, y:1, num)).should.equal num
    
    it "should not add a number to the same field twice", ->
      num = 1
      point = x:1, y:1
      @sudoku.addNumberToGrid point, num
      (=> @sudoku.addNumberToGrid point, num).should.throw()
      
    