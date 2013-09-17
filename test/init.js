if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["board.coffee"]) {
    _$jscoverage["board.coffee"] = [];
    _$jscoverage["board.coffee"][1] = 0;
    _$jscoverage["board.coffee"][3] = 0;
    _$jscoverage["board.coffee"][4] = 0;
    _$jscoverage["board.coffee"][7] = 0;
    _$jscoverage["board.coffee"][10] = 0;
    _$jscoverage["board.coffee"][15] = 0;
    _$jscoverage["board.coffee"][18] = 0;
    _$jscoverage["board.coffee"][19] = 0;
    _$jscoverage["board.coffee"][20] = 0;
    _$jscoverage["board.coffee"][22] = 0;
    _$jscoverage["board.coffee"][23] = 0;
    _$jscoverage["board.coffee"][24] = 0;
    _$jscoverage["board.coffee"][26] = 0;
    _$jscoverage["board.coffee"][29] = 0;
    _$jscoverage["board.coffee"][30] = 0;
    _$jscoverage["board.coffee"][31] = 0;
    _$jscoverage["board.coffee"][32] = 0;
    _$jscoverage["board.coffee"][35] = 0;
    _$jscoverage["board.coffee"][36] = 0;
    _$jscoverage["board.coffee"][37] = 0;
    _$jscoverage["board.coffee"][38] = 0;
    _$jscoverage["board.coffee"][44] = 0;
    _$jscoverage["board.coffee"][47] = 0;
    _$jscoverage["board.coffee"][49] = 0;
}

_$jscoverage["board.coffee"].source = ["class Board", "", "    constructor: () ->", "      @board = {}", "", "    addNumber: (coord, num) ->", "      if @canAddNumber coord, num then @board[@coordToString(coord)] = num", "", "    canAddNumber: (coord, num) ->", "     @canAddNumberToRow(coord, num) &&", "     @canAddNumberToColumn(coord, num) &&", "     @canAddNumberToBlock(coord, num)", "", "    canAddNumberToField: (coord, num) ->", "      @board[@coordToString(coord)] != num", "", "    canAddNumberToBlock: (coord, num) ->", "      intervals = [[1..3], [4..6], [7..9]]", "      colInterval = intervals[Math.floor(coord.col / 3)]", "      rowInterval = intervals[Math.floor(coord.row / 3)]", "      ", "      for col in colInterval", "        for row in rowInterval", "          return false unless @canAddNumberToField({row:row, col:col}, num)", "        # return false unless @canAddNumberToRow({col: col}, num, interval)", "      true", "", "    canAddNumberToColumn: (coord, num) ->", "      coordinates = ({row:row, col:coord.col} for row in [1..9])", "      for coord in coordinates", "        return false unless @canAddNumberToField(coord, num)", "      true", "", "    canAddNumberToRow: (coord, num) ->", "      coordinates = ({row:coord.row, col:column} for column in [1..9])", "      for coord in coordinates", "        return false unless @canAddNumberToField(coord, num)", "      true", "", "    #---------#", "    # helpers #", "    #---------# ", "    coordinatesToBlock: (coord) ->", "      {row: Math.ceil(coord.row / 3), col: Math.ceil(coord.col / 3)}", "", "    coordToString: (coord) ->", "      \"#{coord.row}.#{coord.col}\"", "", "module.exports = Board"];

if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["sudoku.coffee"]) {
    _$jscoverage["sudoku.coffee"] = [];
    _$jscoverage["sudoku.coffee"][1] = 0;
    _$jscoverage["sudoku.coffee"][3] = 0;
    _$jscoverage["sudoku.coffee"][4] = 0;
    _$jscoverage["sudoku.coffee"][7] = 0;
    _$jscoverage["sudoku.coffee"][15] = 0;
    _$jscoverage["sudoku.coffee"][18] = 0;
    _$jscoverage["sudoku.coffee"][20] = 0;
}

_$jscoverage["sudoku.coffee"].source = ["class Sudoku", "  ", "  constructor: () ->", "    @grid = {}", "  ", "  addNumberToGrid: (point, num) ->", "    @grid[@pointToString(point)] = num", "    ", "  ", "  # ===========", "  # = helpers =", "  # ===========", "", "  pointToString: (point) ->", "    return \"#{point.x}.#{point.y}\"", "  ", "  empty: () ->", "    return true", "", "module.exports = Sudoku"];

