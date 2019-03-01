unit uMetodos;

interface

uses
  Vcl.Grids, Vcl.ComCtrls, Data.DB;
  function ExcelParaStringGrid(const AGrid: TStringGrid; const pProgressBar: TProgressBar; var pExcelFile: string): Boolean; external 'ImpExcel.dll';
  procedure ExportarParaExcel(const pDataSet: TDataSet; pCaption: string); external 'ImpExcel.dll';
implementation

end.
