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
or
/home/alakey/work/ardupilotSau/sim/fg_plane_view.sh
```

2. Запустите SITL в терминале обычным способом. В этом случае мы указываем начальное место как аэропорт Сан-Франциско (KSFO):

```bash
sim_vehicle.py -v ArduPlane -L KSFO --enable-fgview --console --map
```

3. Загрузка модуля джойстика
```sh
module load joystick
joystick probe
joystick status
```

4. Взлет скорее всего можно осуществлять в автомате, но для этого нужно прописать WayPoints. Можно взлететь вручную следующим способом, а потом управлять точками через MAVProxy.

```sh
MANUAL> mode fbwa
FBWA> arm throttle
FBWA> rc 3 1800
FBWA> mode circle
```
Регулировка скорости симуляции
`param set SIM_SPEEDUP 5`

# Джойстик (основано на https://ardupilot.org/mavproxy/docs/modules/joystick.html)
0. Закинуть конфиг в либу. Узнать где лежит либа
```python
import MAVProxy
print(MAVProxy.__file__)
```
/home/$USER/.local/lib/python3.10/site-packages/MAVProxy/modules/mavproxy_joystick/joysticks
туда положить файл `logitech-f710.yml`

```yml
description: >
  Support for the Logicool F710 joystick.
match:
  - 'Logitech Gamepad F710'
controls:
  - channel: 1
    type: axis
    id: 3
  - channel: 2
    type: axis
    id: 4
  - channel: 3
    type: axis
    id: 1
    invert: true
  - channel: 4
    type: axis
    id: 0
```


module load joystick


# Работа с MissionPlanner.exe

Запустите Mission Planner и подключитесь к симулятору:
1. mono MissionPlanner.exe
2. В Mission Planner перейдите во вкладку "Connect".
3. Выберите тип соединения "UDP".
4. В поле "Port" укажите 14550 (стандартный порт для SITL).
5. Нажмите "Connect".


# Добавить свой аэропорт
1. Открыть через FlightGear и скачать карту нужного аэропорта.
2. В параметрах fg_plane_view.sh указать желаемый аэропорт. Вероятно также нужно прописать зеркало для terrasync.
3. Добавить в Tools/autotest/locations.txt координаты в формате: latitude,longitude,absolute-altitude,heading. Например координаты аэропорта Пулково для полосы 10L/28R (основной):
- 10L (при взлёте на запад): 59.806667, 30.265000, 24, 100
- 28R (при взлёте на восток):59.796944, 30.308056, 24, 280

# Изменение камеры по дефолту (https://wiki.flightgear.org/Howto:Configure_views_in_FlightGear)
Изменить view в Rascal110-JSBSim-set.xml

# Добавить свой самолет в SITL по типу plane-3d
sim_vehicle.py -v ArduPlane -L $AIRPORT --enable-fgview --console --map --mavproxy-args="--load-module=joystick"

Removing target_list file /home/alakey/work/ardupilotSau/build/sitl/target_list
'configure' finished successfully (1.094s)
{'waf_target': 'bin/arduplane', 'default_params_filename': 'models/plane.parm', 'model': 'plane', 'sitl-port': True}
SIM_VEHICLE: Building
SIM_VEHICLE: "/home/alakey/work/ardupilotSau/modules/waf/waf-light" "build" "--target" "bin/arduplane"
Waf: Entering directory `/home/alakey/work/ardupilotSau/build/sitl'


/start_sim_vehicle.sh
{'waf_target': 'bin/arduplane', 'default_params_filename': [], 'model': 'plane-3d', 'sitl-port': True}
SIM_VEHICLE: Building
SIM_VEHICLE: "/home/alakey/work/ardupilotSau/modules/waf/waf-light" "build" "--target" "bin/arduplane"
Waf: Entering directory `/home/alakey/work/ardupilotSau/build/sitl'
