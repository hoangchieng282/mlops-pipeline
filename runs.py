from roboflow import Roboflow
rf = Roboflow(api_key="Ou4aLECCNHtCfKfZU8na")
project = rf.workspace().project("nuti-competitor-products")
dataset = project.version(5).download("yolov5")

