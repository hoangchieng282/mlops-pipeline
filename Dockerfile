FROM nvcr.io/nvidia/pytorch:22.12-py3
RUN rm -rf /opt/pytorch  # remove 1.2GB dir

# Downloads to user config dir
ADD https://ultralytics.com/assets/Arial.ttf https://ultralytics.com/assets/Arial.Unicode.ttf /root/.config/Ultralytics/

# Install linux packages
RUN apt update && apt install --no-install-recommends -y zip htop screen libgl1-mesa-glx

# Install pip packages (uninstall torch nightly in favor of stable)
COPY requirements.txt .
RUN python -m pip install --upgrade pip wheel
RUN pip uninstall -y Pillow torchtext torch torchvision
RUN pip install --no-cache -U pycocotools  # install --upgrade
RUN pip install --no-cache -r requirements.txt albumentations comet gsutil notebook 'opencv-python<4.6.0.66'  \
    Pillow>=9.1.0 ultralytics \
    --extra-index-url https://download.pytorch.org/whl/cu113

# Create working directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# Copy contents
# COPY . /usr/src/app  (issues as not a .git directory)
# RUN git clone https://github.com/ultralytics/yolov5 /usr/src/app

# Set environment variables
ENV OMP_NUM_THREADS=1


