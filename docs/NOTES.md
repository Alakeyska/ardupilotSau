# Работа с FlightGear


0. Установите FlightGear из терминала:

```bash
sudo apt-get install flightgear
```

Открыть FlightGear и в настройках лаунча добавить строчку на зеркало:
--prop:/sim/terrasync/http-server=http://flightgear.sourceforge.net/scenery

1. Откройте новую командную строку и запустите соответствующий файл оболочки для вашего транспортного средства в /ardupilot/Tools/autotest/ : fg_plane_view.sh (самолет) и fg_quad_view.sh (вертолет).

```bash
/home/alakey/work/ardupilotSau/Tools/autotest/fg_plane_view.sh
```

2. Запустите SITL в терминале обычным способом. В этом случае мы указываем начальное место как аэропорт Сан-Франциско (KSFO):

```bash
sim_vehicle.py -v ArduPlane -L KSFO --enable-fgview --console --map
```

3. Взлет скорее всего можно осуществлять в автомате, но для этого нужно прописать WayPoints. Можно взлететь вручную следующим способом, а потом управлять точками через MAVProxy.

```sh
MANUAL> mode fbwa
FBWA> arm throttle
FBWA> rc 3 1800
FBWA> mode circle
```