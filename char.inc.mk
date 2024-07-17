NULL :=

# $(:)
CHAR_COLON := :
$(CHAR_COLON) := $(CHAR_COLON)

# $(=)
CHAR_EQUALS := =
$(CHAR_EQUALS) = $(CHAR_EQUALS)

# $(#)
CHAR_HASH := \#
$(CHAR_HASH) := $(CHAR_HASH)

# $(;)
CHAR_SEMICOLON := ;
$(CHAR_SEMICOLON) := $(CHAR_SEMICOLON)

# $( )
CHAR_SPACE := $(NULL) $(NULL)
$(CHAR_SPACE) := $(CHAR_SPACE)

# $(\t)
CHAR_TAB := $(NULL)	$(NULL)
\t := $(CHAR_TAB)

# $(\n)
define CHAR_NEWLINE


endef
\n := $(CHAR_NEWLINE)
