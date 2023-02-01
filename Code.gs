function onOpen() {
  var ui = SpreadsheetApp.getUi();

  ui.createMenu('RVTools')
      .addItem('Import', 'importCSV')
      .addToUi();
}

function importCSV() {
  const fileName = 'RVTools_tabvInfo.csv';     replace with the file name of the CSV you want imported
  const file = DriveApp.getFilesByName(fileName).next();     search your Drive for the CSV file name

  const dataBlob = file.getBlob();
  const csvString = dataBlob.getDataAsString();
  const csvData = Utilities.parseCsv(csvString);
  const sheet = SpreadsheetApp.getActiveSheet();
  const allData = sheet.getDataRange().getValues();
  
   clear contents of google sheet
  try {
    var start = 2;     hard coded row number from where to start deleting - to retain headers
    var toDelete;

    toDelete = sheet.getLastRow() - start + 1;

    sheet.deleteRows(start, toDelete);
    }
      catch(err) {  catch errors when out of bounds (i.e. no cells to clear)
        Logger.log(err);
    } 

   import csv data
  const obj = allData.reduce((o, r) = (o[r.join()] = true, o), {});
  const values = csvData.filter(r = !obj[r.join()]);
  if (values.length  0) {
    sheet.getRange(sheet.getLastRow() + 1, 1, values.length, values[0].length).setValues(values);
  }
}