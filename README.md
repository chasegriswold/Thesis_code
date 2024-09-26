# Thesis_code
Code and Data.

The code I wrote throughout my Master's Thesis research to plot and analyze the conductive polymer antenna and biological tissue measurements.

I've included all the measurements we took over the course of the research project. The file paths in the code won't run as they are, since they are hardcoded to run on my local machine, but the folders that contain the measurement data are named in such a way that future users could figure out 'what data goes where' in the code if they downloaded the data and wanted to run the code.

The statistics code (look for the Z_Test... filename) is very easy to use for doing z-test, t-test, and power analysis if you've already collected measurements and want to know how many more samples you need based on the calculated mean and standard deviation to avoid Type I and Type II errors.

NOTE: There is also code that can convert all S11 .csv files in a directory into real and imaginary impedance data saved to another pre-created directory, as long as the VNA saves off the angle along with the magnitude in dB. Some older VNA models do not do this. You'll need to use the header/footer removal code before the Z (impedance) conversion if you are using a newer Keysight VNA. For some unknown reason, Keysight put the word "END" at the end of the .csv it exports when you capture data, which is really stupid, and causes coding problems. It was easier to just write code to for-loop through an entire directory and remove the "end" word from every file in that directory rather than mess with code that works just fine for all measurements taken from other devices that don't add that stupid word at the end. Like, come on Keysight. Stupid.

NOTE: The Smith Chart data in every antenna folder (except the 85 measurements of the silver epoxy copper antenna) are not identical measurements to the LogMag (|S11|) data contained in the other folders. I did not use the convert to Z code I have now written back then, and just took a second measurement in smith chart mode.

NOTE: The complex permittivity plotting code automatically derives and plots the conductivity from the permittivity measurements you've taken.


