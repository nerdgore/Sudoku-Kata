class Sudoku
  
  constructor: () ->
    @grid = {}
  
  addNumberToGrid: (point, num) ->
    @grid[@pointToString(point)] = num
    
  
  # ===========
  # = helpers =
  # ===========

  pointToString: (point) ->
    return "#{point.x}.#{point.y}"
  
  empty: () ->
    return true

module.exports = Sudoku