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
      true
    
    
    
    
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
    ###
    coordToPoint: (obj) ->
      "#{obj.col}.#{obj.row}"
    
    addNumberToGrid: (point, num) ->
      throw new Error "Number exists" if @numberExists point, num
      throw new Error "Number already in row" unless @canAddNumberToRow point, num
      throw new Error "Number already in column" unless @canAddNumberToColumn point, num
      throw new Error "Number already in block" unless @canAddNumberToBlock point, num
      @grid[@pointToString(point)] = num
    
    canAddNumberToRow: (point, num) ->
      coords = ({row:row, col:point.col} for row in [1..9])
      for coord in coords
        return false if @numberExists(coord, num)
      true
      
    canAddNumberToColumn: (point, num) ->
      coords = ({row:point.row, col:column} for column in [1..9])
      for coord in coords
        return false if @numberExists(coord, num)
      true
    
    
    canAddNumberToBlock: (point, num) ->
      rowInterval = [4..6]
      columnInterval = [4..6]
      
      for row in rowInterval
        for col in columnInterval
          return false if @numberExists(row:row, col:col, num)
      
      true
    
    
    numberExists: (point, num) ->
      true unless @grid[@pointToString(point)] != num
    
    # ===========
    # = helpers =
    # ===========
    
    currentInterval: (point) ->
      intervals = [[1..3], [4..6], [7..9]]
      
      rowInterval = intervals[Math.ceil(point.row / 3) - 1]
      colInterval = intervals[Math.ceil(point.col / 3) -1]
      
      {row: rowInterval, col: colInterval}
    
    pointToString: (point) ->
      return "#{point.row}.#{point.col}"
    ###
