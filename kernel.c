void main() {
    
    char* video_memory = (char*)0xb8000;

    void print(char* sentence) {
        for (int i = 0; sentence[i] != '\0'; ++i) {
        *(video_memory + i * 2) = sentence[i];     // Write the character
        *(video_memory + i * 2 + 1) = 0x0F;        // Attribute byte (white on black)
        }
    }

    char* sentence = "Welcome to LowS";

    print(sentence);
    
    return;
}