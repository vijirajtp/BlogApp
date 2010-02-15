class Post < ActiveRecord::Base

  acts_as_taggable

  attr_accessible :new_posts_category_attributes, :existing_posts_category_attributes, :title, :content, :uploaded_data, :tag_list

  belongs_to :user
  has_many :posts_categories, :dependent => :destroy
  has_many :categories, :through => :posts_categories
  has_many :comments, :dependent => :destroy

  validates_presence_of :title

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment

  before_update :save_posts_categories

  def new_posts_category_attributes=(posts_category_attributes)
    posts_category_attributes.each do |index, attributes|
      if attributes[:category_id].to_i != 0
        posts_categories.build(attributes)
      end
    end
  end

  def existing_posts_category_attributes=(posts_category_attributes)
    posts_category_attributes.each do |index, attributes|
      category = posts_categories.detect{|c| c.category_id == index.to_i}
      if !category.blank? && attributes[:category_id].to_i == 0
        category.should_destroy = 1
      end
    end
  end

  def save_posts_categories
    posts_categories.each do |posts_category|
      if posts_category.should_destroy?
        posts_category.destroy
      else
        posts_category.save
      end
    end
  end
 end
