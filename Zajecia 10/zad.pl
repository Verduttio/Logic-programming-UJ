split2(Filename, FileNameA, FileNameB) :-
    open(Filename, read, InStream),
    open(FileNameA, write, OutStreamA),
    open(FileNameB, write, OutStreamB),
    read_chars(InStream, OutStreamA, OutStreamB, 0),
    close(InStream),
    close(OutStreamA),
    close(OutStreamB).

read_chars(InStream, OutStreamA, OutStreamB, Index) :-
    get_char(InStream, Char),
    (Char == end_of_file -> true;
     (0 is Index mod 2 -> put_char(OutStreamA, Char); put_char(OutStreamB, Char)),
     NewIndex is Index + 1,
     read_chars(InStream, OutStreamA, OutStreamB, NewIndex)).


join2(FileNameA, FileNameB, FileName) :- 
    open(FileNameA, read, InStreamA),
    open(FileNameB, read, InStreamB),
    open(FileName, write, OutStream),
    read_chars2(InStreamA, InStreamB, OutStream),
    close(InStreamA),
    close(InStreamB),
    close(OutStream).

read_chars2(InStreamA, InStreamB, OutStream) :-
    get_char(InStreamA, CharA),
    get_char(InStreamB, CharB),
    (CharA == end_of_file -> true;
    CharB == end_of_file -> true;
     put_char(OutStream, CharA),
     put_char(OutStream, CharB),
     read_chars2(InStreamA, InStreamB, OutStream)).
