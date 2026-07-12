// 0 = Showing Title, 1 = Typewriting the Intro Text
state = 0; 

// First paragraph
intro_text = "For generations, the people of Greyford have lived in the shadow of Blackstone Cave, a place feared more than it is understood.\n\nMost people choose to leave the mystery alone.\n\nBut I couldn't.";

// Second paragraph
second_text = "He's gone...\n\nThe water swallowed him before I could react.\n\nNow I have to go deeper alone.\n\nI have to find him.";

current_stage = 1;     // Starts at the first paragraph
char_count = 0;       // Character count for typing effect
typewrite_speed = 0.4; // Pacing speed of the typewriter letters

// Transition Fades
fade_alpha = 0;      
fade_out = false;    
target_room = rVillage;		