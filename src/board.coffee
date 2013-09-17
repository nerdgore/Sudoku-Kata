class Board

    constructor: () ->
      @board = {}

    addNumber: (coord, num) ->
      if @canAddNumber coord, num then @board[@coordToString(coord)] = num

    canAddNumber: (coord, num) ->
     @canAddNumberToRow(coord, num) &&
     @canAddNumberToColumn(coord, num) &&
     @canAddNumberToBlock(coord, num)

    canAddNumberToField: (coord, num) ->
      @board[@coordToString(coord)] != num

    canAddNumberToBlock: (coord, num) ->
      intervals = [[1..3], [4..6], [7..9]]
      colInterval = intervals[Math.floor(coord.col / 3)]
      rowInterval = intervals[Math.floor(coord.row / 3)]
      
      for col in colInterval
        for row in rowInterval
          return false unless @canAddNumberToField({row:row, col:col}, num)
        # return false unless @canAddNumberToRow({col: col}, num, interval)
      true

    canAddNumberToColumn: (coord, num) ->
      coordinates = ({row:row, col:coord.col} for row in [1..9])
      for coord in coordinates
        return false unless @canAddNumberToField(coord, num)
      true

    canAddNumberToRow: (coord, num) ->
      coordinates = ({row:coord.row, col:column} for column in [1..9])
      for coord in coordinates
        return false unless @canAddNumberToField(coord, num)
      true

    #---------#
    # helpers #
    #---------# 
    coordinatesToBlock: (coord) ->
      {row: Math.ceil(coord.row / 3), col: Math.ceil(coord.col / 3)}

    coordToString: (coord) ->
      "#{coord.row}.#{coord.col}"

module.exports = Board