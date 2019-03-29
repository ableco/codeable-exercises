# form_tag = <%= file_field_tag "photo[image]" %>
# <%= text_field_tag "photo[description]" %>

<input type="file" name="photo[image]">
<input type="text" name="photo[description]">


def photo_params
    params.require(:photo).permit(:image, :description)
end

puts photo_params