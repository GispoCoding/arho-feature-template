from qgis.PyQt.QtCore import QObject, pyqtSignal


class EventBusSignals(QObject):
    plan_set = pyqtSignal()
    plan_unset = pyqtSignal()


class EventBus:
    _instance = None

    def __init__(self):
        self.signals = EventBusSignals()

    @classmethod
    def instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance
