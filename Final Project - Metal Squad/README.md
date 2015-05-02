#Metal Squad Final Project: Street Fighter 1.5

Please follow these instructions to recreate the game.

##What you need:
- Digilent Nexys3 FGPA board
- Micro USB cable connected to programming machine
- Digilent Adept installed provided in `http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,69&Prod=ADEPT&CFID=9664353&CFTOKEN=4279907a43dde4cd-B5F5C37F-5056-0201-02F8022A823D239D`
- VGA display monitor
- `processor.bit`: Already compiled inside `Final Project Metal Squad` folder. If necessary, using Xilinx ISE 14.7 to recompile
- `ken_reduced_odd.bin`: Bin file for Ken's spritesheet
- `ryu_reduced_odd.bin`: Bin file for Ryu's spritesheet

##How to compile:
- Open Digilent Adept tool, connect to Nexys3
- Go to Memory tab, select RAM, then load `ken_reduced_odd.bin` first at location 0 (dec)
- Then load `ryu_reduced_odd.bin` at location 950000 (dec)
- Go back to Config tab, select `processor.bit` and Program
- Have fun!

##Reference:
- See `Ken.gif`, `Ryu.gif`, `logo.png` and `ko.png` for actual images
- See `Final Project Metal Squad/Matlab Code/coe.m` for Matlab code to convert images to `.coe` and `.bin` files
- See `https://www.micron.com/~/media/documents/products/data-sheet/dram/mobile-dram/psram/128mb_burst_cr1_5_p26z.pdf` for Nexys3 Celluler Ram Controller

##Link for presentation:
`https://docs.google.com/presentation/d/1FqDszrNlHWRIf22vGXkWBOj1e-d5YUlQcWS-1XlWPXM/edit?usp=sharing` 



