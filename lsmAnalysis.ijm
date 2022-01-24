/*
 * This is a generalized script to analyze LSM images.
 * It will perform a maximum intensity projection of all stacks,
 * allow the user to adjust the color balance of each channel,
 * then combine all channels into a single RGB image and save.
 * 
 * Written by:  Thomas L. Moore
 * 
 * Contact: tlmoore1928@gmail.com
 * 
 * This macro is in the public domain. Feel free to use and
 * modify it.
 */

title = getTitle(); // Get title of the open window (i.e. the initial z-stack LSM image)
wd = getDirectory("image"); // Get the image's working directory


// Run a maximum intensity projection on the image
run("Z Project...", "projection=[Max Intensity]");
selectWindow(title);
close();
max_title = "MAX_"+title
selectWindow(max_title);

// Manually perform color balance adjustment on each channel
// showMessage("User Input", "For each channel, adjust the color balance.\n"+
// 	"Close both windows when finished.");
run("Color Balance...");
run("Channels Tool...");
waitForUser("User Input", "For each channel, adjust the color balance.\n"+
	"Close both windows and press \"OK\" when finished.");

// Convert image to an RGB type
Stack.setDisplayMode("composite");
run("RGB Color");
rgb_title = max_title+" (RGB)"
selectWindow(max_title);
close();

// Add scale bar to image
run("Scale Bar...");

// Save the image
save_title = max_title+"_rgb"
dotIndex = indexOf(save_title, ".");
save_title = substring(save_title, 0, dotIndex)
saveAs("PNG", wd+save_title);