class LayerNotFoundError(Exception):
    def __init__(self, layer_name: str):
        super().__init__(f"Layer {layer_name} not found")


class LayerNotVectorTypeError(Exception):
    def __init__(self, layer_name: str):
        super().__init__(f"Layer {layer_name} is not a vector layer")


class UnexpectedNoneError(Exception):
    """Internal QGIS errors that should not be happened"""
