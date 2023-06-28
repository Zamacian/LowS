void main() {
    
    char* video_memory = (char*)0xb8000;

    void print(char* sentence, int row, int column, char attribute) {
        int position = (row * 80 + column) * 2;  // Calculate the position in video memory

        for (int i = 0; sentence[i] != '\0'; ++i) {
            *(video_memory + position + i * 2) = sentence[i];     // Write the character
            *(video_memory + position + i * 2 + 1) = attribute;   // Set the attribute byte
        }
    }

    //print("<sentence>", <row line>, <column line>, 0x<background color><foreground color>)
    //One row can print 80 characters
    //And you have a total of 25 rows
    /*
    VGA Color sheet :
        0 : Black
        1 : Dark Blue
        2 : Dark Green
        3 : Dark Cyan
        4 : Dark Red
        5 : Dark Magenta
        6 : Dark Yellow
        7 : Grey
        8 : Dark Grey
        9 : Blue
        A : Green
        B : Cyan
        C : Red
        D : Magenta
        E : Yellow
        F : White
    */
    print("Hello", 0, 0, 0xAC );
    print("World!", 0, 6, 0x9D );
    
    return;
}
