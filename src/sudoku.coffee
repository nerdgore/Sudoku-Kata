# 
#  sudoku.coffee
#  Sudoku-Kata
#  
#  Created by Torsten Walter on 2013-10-14.
#  Copyright 2013 mobile.international GmbH. All rights reserved.
# 


if typeof define != "function"
  define = require("amdefine")(module)



define ->
  class Sudoku
  
    constructor: () ->
      @grid = {}
    
    
    addNumber: (point, num) ->
      @grid[point] = num
    
    
    numberExists: (point, num) ->
      @grid[point] is num
    
    
    numberInColumn: (point, num) ->
      row = @pointToCoord(point).row
      for col in [1..9]
        return true if @numberExists "#{col}.#{row}", num
      false
    
    
    numberInRow: (point, num) ->
      col = @pointToCoord(point).col
      for row in [1..9]
        return true if @numberExists "#{col}.#{row}", num
      false
    
    
    
    
    # ===========
    # = Helpers =
    # ===========
    
    pointToCoord: (point) ->
      digits = [1..9]
      indizes = point.split "."
      col = Number indizes[0]
      row = Number indizes[1]
      
      if indizes.length != 2 or col not in digits or row not in digits
        throw new Error "Point out of bounds!"
      
      col:col, row:row
    
    
    coordToPoint: (obj) ->
      "#{obj.col}.#{obj.row}"
