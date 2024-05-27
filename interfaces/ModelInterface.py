from abc import ABC, abstractmethod

class Modelinterface(ABC):
    @abstractmethod
    def all():
        pass

    @abstractmethod
    def store(obj):
        pass

    @abstractmethod
    def find(id):
        pass

    @abstractmethod
    def update(id, obj):
        pass

    @abstractmethod
    def delete(id):
        pass
