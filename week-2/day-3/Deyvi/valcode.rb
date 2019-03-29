def validate_code(code)
 code.to_s =~ (/\A[123]/) ? true : false
end
