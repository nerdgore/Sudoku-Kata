Board = require "board"

describe "A SudokuBoard", ->
  it "should be defined", ->
    (Board).should.be.defined

describe "canAddNumber", ->
  test = {}
  
  beforeEach ->
    test.board = new Board
  
  it "should be able to add number to an empty board", ->
    test.board.canAddNumber({row: 1, col: 1}, 1).should.be.true

  it "should not be able to add a number twice to the same row", ->
    test.board.addNumber({row: 1, col: 1}, 1)
    
    test.board.canAddNumber({row: 1, col: 7}, 1).should.be.false

  it "should not be able to add a number twice to the same column", ->
    test.board.addNumber({row: 1, col: 1}, 1)
    
    test.board.canAddNumber({row: 8, col: 1}, 1).should.be.false

  it "should not be able to add a number twice to the same block", ->
    test.board.addNumber({row: 1, col: 1}, 1)
    
    test.board.canAddNumber({row: 2, col: 2}, 1).should.be.false

  it "should be able to add the same number to another block", ->
    test.board.addNumber({row: 1, col: 1}, 1)
    
    test.board.canAddNumber({row: 4, col: 2}, 1).should.be.true
