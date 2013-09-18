class Sudoku
  
  constructor: () ->
    @grid = {}
  
  addNumberToGrid: (point, num) ->
    throw "Can't add number" unless @canAddNumber point, num
    @grid[@pointToString(point)] = num
    
  canAddNumber: (point, num) ->
    true unless @grid[@pointToString(point)] == num
    
  # ===========
  # = helpers =
  # ===========

  pointToString: (point) ->
    return "#{point.x}.#{point.y}"

module.exports = Sudoku
