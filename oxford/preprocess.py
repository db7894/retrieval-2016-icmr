# imports
import os, glob, shutil
import caffe

# set paths to dataset images
path_images = "/home/mirlab/cnn-cbir-benchmark/datasets/oxford/"

# dataset topics
subfolders = os.listdir( path_images )

# image counters
count = 0
v_c = 0
h_c = 0
corrupted = 0


# index aspect ratio
txt_vertical = 'list_oxford_vertical.txt'
txt_horitzontal = 'list_oxford_horitzontal.txt'
txt_corrupt = 'corrupted.txt'

f_vert = open( txt_vertical, "w" )
f_hort = open( txt_horitzontal, "w" )
f_corr = open( txt_corrupt, "w" )


for image_name in os.listdir(path_images):
    # check vertical/horizontal
    try:
        ima = cafe.io.load_image(os.path.join(path_images, image_name))

        # check panorama/portrait
        if ima.shape[0] > ima.shape[1]:
            # portrait -- vertical
            f_vert.write( "{}\n".format( os.path.join(path_images, image_name ) ) )
            v_c += 1
        else:
            # panorama -- horizontal
            f_hort.write( "{}\n".format( os.path.join( path_images, image_name ) ) )
            h_c += 1

        count += 1
    except:
        f_corr.write( "{}\n".format(   os.path.join( path_images, image_name ) ) )
        corrupted += 1
    print "{} {}".format( count, os.path.join( path_images, image_name ) )


# for subfolder in ["oxc1_100k"] :

    # get images per topic
#     topics = os.listdir( os.path.join( path_images, subfolder ) )

#     for topic in topics:
#         images = os.listdir( os.path.join( path_images, subfolder, topic ) )

#         for name_ima in images:

            # check vertical/horitzontal
#             try:
#                 ima = caffe.io.load_image( os.path.join( path_images, subfolder, topic, name_ima ) )

                # check panorama/portrait
#                 if ima.shape[0] > ima.shape[1]:
                    # portrait -- vertical
#                     f_vert.write( "{}\n".format( os.path.join(path_images, subfolder, topic, name_ima ) ) )
#                     v_c += 1
#                 else:
                    # panorama -- horitzontal
#                     f_hort.write( "{}\n".format( os.path.join( path_images, subfolder, topic, name_ima ) ) )
#                     h_c += 1

#                 count += 1
#             except:
#                 f_corr.write( "{}\n".format(   os.path.join( path_images, subfolder, topic, name_ima ) ) )
#                 corrupted += 1

#             print "{} {}".format( count, os.path.join( path_images, subfolder, topic, name_ima ) )
#     break

f_vert.close()
f_hort.close()
f_corr.close()

print "Total images {}".format( count )
print "\t vertical: {}".format( v_c )
print "\t horitzontal: {}".format( h_c )
