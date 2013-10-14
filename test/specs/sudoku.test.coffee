Sudoku = require "sudoku"

describe "Sudoku", ->
  digits = [1..9]
  
  beforeEach ->
    @sudoku = new Sudoku
  
  
  it "should be defined", ->
    (Sudoku).should.be.ok
  
  
  
  
  describe "addNumber", ->
    for num in digits
      do (num) ->
        it "should add #{num} to the grid", ->
          @sudoku.addNumber("1.1", num).should.equal num
  
  
  
  
  describe "pointToCoord", ->
    errorPointOutOfBounds= "Point out of bounds!"
    it "should throw an error if an invalid point is given", ->
      (=> @sudoku.pointToCoord "1").should.throw errorPointOutOfBounds
    
    
    it "should throw an error if a row is 0 or negative", ->
      (=> @sudoku.pointToCoord "1.0").should.throw errorPointOutOfBounds
      (=> @sudoku.pointToCoord "1.-1").should.throw errorPointOutOfBounds
    
    
    it "should throw an error if a row is larger than 9", ->
      (=> @sudoku.pointToCoord "1.10").should.throw errorPointOutOfBounds
    
    
    it "should throw an error if a column is 0 or negative", ->
      (=> @sudoku.pointToCoord "0.1").should.throw errorPointOutOfBounds
      (=> @sudoku.pointToCoord "-1.1").should.throw errorPointOutOfBounds
    
    
    it "should throw an error if a column is larger than 9", ->
      (=> @sudoku.pointToCoord "10.1").should.throw errorPointOutOfBounds
  
  
  
  
  describe "numberExists", ->
    it "should return false if the number does not exist on the given point", ->
      @sudoku.numberExists("1.1", 1).should.equal false
    
    
    it "should return true if the number already exists on the given point", ->
      @sudoku.addNumber "1.1", 1
      
      @sudoku.numberExists("1.1", 1).should.equal true
  
  
  
  describe "numberInColumn", ->
    it "should return false if the number is not in the given column", ->
      @sudoku.numberInColumn("1.1", 1).should.equal false
    
    
    it "should return true if the number is in the given column", ->
      @sudoku.addNumber "1.1", 1
      
      @sudoku.numberInColumn("5.1", 1).should.equal true
  
  
  
  
  describe "numberInRow", ->
    it "should return false if the number is not in the given row", ->
      @sudoku.numberInRow("1.1", 1).should.equal false
    
    
    it "should return true if the number is in the given row", ->
      @sudoku.addNumber "1.1", 1
      
      @sudoku.numberInRow("1.5", 1).should.equal true




