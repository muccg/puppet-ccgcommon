require 'puppet/provider/package'

Puppet::Type.type(:package).provide :yum_nogpgcheck,
  :parent => :yum, :source => :yum do

	desc "Yum provider with --nogpgcheck enabled for local install of unsigned rpm files."

        has_feature :versionable

	def install
	    should = @resource.should(:ensure)
	    self.debug "Ensuring => #{should}"
	    wanted = @resource[:name]
	    operation = :install

	    case should
	    when true, false, Symbol
	      # pass
	      should = nil
	    else
	      # Add the package version
	      wanted += "-#{should}"
	      is = self.query
	      if is && Puppet::Util::Package.versioncmp(should, is[:ensure]) < 0
	        self.debug "Downgrading package #{@resource[:name]} from version #{is[:ensure]} to #{should}"
	        operation = :downgrade
	      end
	    end

	    output = yum "--nogpgcheck", "-d", "0", "-e", "0", "-y", operation, wanted

	    is = self.query
	    raise Puppet::Error, "Could not find package #{self.name}" unless is

	    # FIXME: Should we raise an exception even if should == :latest
	    # and yum updated us to a version other than @param_hash[:ensure] ?
	    raise Puppet::Error, "Failed to update to version #{should}, got version #{is[:ensure]} instead" if should && should != is[:ensure]
  	end
end

