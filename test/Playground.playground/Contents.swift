import Cocoa

var greeting = "Hello, playground"


//оздать playground.
//На главном потоке по букве асинхронно выведите “HELLO”. Для букв “H” и “O” дополнительно, перед выводом вызовите sleep(1).
//Запустите код и посмотрите на результат.


//DispatchQueue.main.async{sleep(1) ; print("H")}
//DispatchQueue.main.async{print("E")}
//DispatchQueue.main.async{print("L")}
//DispatchQueue.main.async{print("L")}
//DispatchQueue.main.async{sleep(1) ; print("O")}


//В песочнице на глобальной очереди по букве выведите “HELLO”. Для букв “H” и “O” дополнительно, перед выводом вызовите sleep(1). Затем запустите код и посмотрите на результат.
//
//DispatchQueue.global().async{sleep(1) ; print("H")}
//DispatchQueue.global().async{print("E")}
//DispatchQueue.global().async{print("L")}
//DispatchQueue.global().async{print("L")}
//DispatchQueue.global().async{sleep(1) ; print("O")}


//Измените код задания 3. Вывод “H” не меняется. то есть буква выводится на глобальной очереди, а перед этим вызывается sleep(1). Остальные же буквы выводить просто через print, то есть
//print("E")
//print("L")
//print("L")
//print("O")
//Затем запустите код и посмотрите на результат.

//DispatchQueue.global().async{sleep(1) ; print("H")}
//print("E")
//print("L")
//print("L")
//print("O")

//Теперь изменить async на sync (при выводе “H”). Запустите код и посмотрите на результат. Объясните разницу результатов пункта 5 и 6, если она есть.

DispatchQueue.global().sync{sleep(1) ; print("H")}
print("E")
print("L")
print("L")
print("O")
