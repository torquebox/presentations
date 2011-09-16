module DataMapper::Adapters

  class SampleAdapter < AbstractAdapter
    def initialize( name, options )
      # Initialize your stuffs
    end


    def create( resources )
      # create resources
    end

    def read( query )
      # fetch resources
    end

    def update( attributes, collection )
      # update resources
    end

    def delete( collection )
      # delete resources
    end
  end

end
