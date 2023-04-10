import 'dart:core';
import 'dart:math';

class MineSweeperGameNew {
   int row =6;
   int col =6;
  int cells;
  int ?unSelectNum;
  int ?minesNumber;
  bool gameOver = false;
  bool gameWin = false;
  List<Cell> gameMap = [];
   List<List<Cell>> map ;
   MineSweeperGameNew({ required this.row, required this.col, required this.cells, required this.map}){
     unSelectNum=cells;
   }
  void generateMap(int num) {
    placeMines(num);
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        gameMap.add(map[i][j]);
      }
    }
  }


  void resetGame(int num) {
    map = List.generate(
        row,
        (x) => List.generate(
            col, (y) => Cell(row: x, col: y, content: '', reveal: false)));
    gameMap.clear();
    generateMap(num);
  }



   void placeMines(int minesNumber) {

     this.minesNumber=minesNumber;

    Random random = Random();
    for (int i = 0; i < minesNumber; i++) {
      int mineRow = random.nextInt(row);
      int mineCol = random.nextInt(col);
      void mines(){
        Cell cell = map[mineRow][mineCol];
        if( cell==Cell(row: mineRow, col: mineCol, content: 'X', reveal: false)){
          mineRow = random.nextInt(row);
          mineCol = random.nextInt(col);
          mines();
        }
        return;
      }
     // mines();
      map[mineRow][mineCol] =
          Cell(row: mineRow, col: mineCol, content: 'X', reveal: false);
    }
  }

  void showMines() {
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        if (map[i][j].content == 'X') {
          map[i][j].reveal = true;
        }
      }
    }
  }

  void getClickedCell(Cell cell) {
    if (cell.content == 'X') {
      showMines();
      gameOver = true;
    } else {
      unSelectNum = unSelectNum! - 1;
      int mineCount = 0;
      int? cellRow = cell.row;
      int? cellCol = cell.col;

      for (int i = max(cellRow! - 1, 0); i <= min(cellRow + 1, row - 1); i++) {
        for (int j = max(cellCol! - 1, 0);
            j <= min(cellCol + 1, col - 1);
            j++) {
          if (map[i][j].content == 'X') {
            mineCount++;
          }
        }
      }
      cell.content = mineCount;
      cell.reveal = true;
      if (mineCount== 0){
        for (int i= max(cellRow -1, 0);i<= min(cellRow +1,row -1 );i++){
          for (int j =max(cellCol! -1 , 0);
          j<= min (cellCol+1 ,col -1 );j++){
            if (map[i][j].content==""){
              getClickedCell(map[i][j]);
            }
          }
        }
      }
      if (minesNumber==unSelectNum){
        print('hero');
        gameWin=true;
        showMines();
      }
    }
  }
}

class Cell {
  int? row;
  int? col;
  dynamic content;

  bool reveal = false;

  Cell(
      {required this.row,
      required this.col,
      required this.content,
      required this.reveal});
}
