class ImageUploader < CarrierWave::Uploader::Base

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 受け付ける画像の種類
  def extension_whitelist
    %w(png jpg jpeg)
  end
end
