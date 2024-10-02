# Klipper-Backup 💾 
Klipper backup script for manual or automated GitHub backups 

This backup is provided by [Klipper-Backup](https://github.com/Staubgeborener/klipper-backup).

## Setup
### Voron 2.4r2 (350)
* Firmware: [Klipper](https://www.klipper3d.org/) (Raspberry Pi 5, 8GB RAM)
* Interface: [Mainsail](https://docs.mainsail.xyz/)
* Mainboard: [BIGTREETECH Octopus](https://bigtree-tech.com)
* Extruder: Direct Drive
* Probe: [Voron Tap](https://github.com/VoronDesign/Voron-Tap)
* Other Mods: [Servo-powered Nozzle Brush](https://github.com/tronfu/Voron-Mods/tree/main/Servo_Nozzle_Brush)
* Slicer of choice: [OrcaSlicer](https://github.com/SoftFever/OrcaSlicer)

(Need `@reboot sed -i 's\TRSYNC_TIMEOUT = 0.025\TRSYNC_TIMEOUT = 0.05\g' ~/klipper/klippy/mcu.py` as crontab in order to fix [timeout issue](https://canbus.esoterical.online/troubleshooting/timeout_during_homing_probing.html))

### Bambu Lab X1-Carbon with AMS
* Other Mods: Light mod incoming
* Slicer of choice: [BambuStudio](https://github.com/bambulab/BambuStudio)
