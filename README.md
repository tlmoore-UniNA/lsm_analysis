This is a script for performing a simple analysis of a confocal z-stack.
To start, simply load the image file (e.g. an `.nd2` or `.lsm` file) into ImageJ/FIJI.
Next, select the window with your z-stack/hyperstack image, and run this script:
`>Plugins>Macros>Run...`

This script will first perform a maximum intensity projection of the z-stack, and then
allow the user to adjust the color balance of each channel. Then all channels will be
combined into an RGB image, the user will set a scale bar, and then the image will
be saved in the working directory as a `.png` file.
