from PIL import Image # Must run pip install Pillow onto current environment before running
import os
import glob

def compress_images(directory=False, quality=30, max_width=1900):
  images = [file for file in glob.iglob(root_dir + '**/**', recursive=True) if file.endswith(('jpg', 'png', 'jpeg'))]
  # list of all images in this directory

  for image in images:
    try:
        img = Image.open(image)
        image_name = image.split('/')[-1]
        uncompressed_size = len(img.fp.read())
        new_file = root_dir + '/compressed_' + image_name
        
        if img.size[0] > max_width:
            ratio = img.size[0] / max_width
            img = img.resize((int(img.size[0] / ratio), int(img.size[1] / ratio)))
    
        img.save(new_file,
            optimize=True,
            quality=quality)
        
        compressed_size = len(Image.open(new_file).fp.read())
        if compressed_size < uncompressed_size:
            print(f'Compressed {image_name} from {uncompressed_size} to {compressed_size} bytes')
            os.replace(new_file,image)
        else:
            print(f'Compressed image {image_name} is larger than original, skipping...')
            os.remove(new_file)

        img.close()
        
    except Exception as e:
        print("An exception occurred on", image, ':', e)

root_dir = 'source/images/blogimages'
print('Recursively compressing images in', root_dir)

# for path in subdirectory_paths:
compress_images(directory=root_dir)
