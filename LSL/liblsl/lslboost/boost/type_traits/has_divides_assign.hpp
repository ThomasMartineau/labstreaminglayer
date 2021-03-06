//  (C) Copyright 2009-2011 Frederic Bron.
//
//  Use, modification and distribution are subject to the Boost Software License,
//  Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
//  http://www.boost.org/LICENSE_1_0.txt).
//
//  See http://www.boost.org/libs/type_traits for most recent version including documentation.

#ifndef BOOST_TT_HAS_DIVIDES_ASSIGN_HPP_INCLUDED
#define BOOST_TT_HAS_DIVIDES_ASSIGN_HPP_INCLUDED

#define BOOST_TT_TRAIT_NAME has_divides_assign
#define BOOST_TT_TRAIT_OP /=
#define BOOST_TT_FORBIDDEN_IF\
   (\
      /* Lhs==fundamental and Lhs==const and Rhs==fundamental */\
      (\
         ::lslboost::is_fundamental< Lhs_nocv >::value && \
         ::lslboost::is_const< Lhs_noref >::value && \
         ::lslboost::is_fundamental< Rhs_nocv >::value\
      ) || \
      /* Lhs==pointer and (Rhs==fundamental or Rhs==pointer) */\
      (\
         ::lslboost::is_pointer< Lhs_noref >::value && \
         ( \
            ::lslboost::is_fundamental< Rhs_nocv >::value || \
            ::lslboost::is_pointer< Rhs_noref >::value\
          )\
      )||\
      /* Rhs==pointer and (Lhs==fundamental or Lhs==pointer) */\
      (\
         ::lslboost::is_pointer< Rhs_noref >::value && \
         ( \
            ::lslboost::is_fundamental< Lhs_nocv >::value || \
            ::lslboost::is_pointer< Lhs_noref >::value\
          )\
      )\
      )


#include <boost/type_traits/detail/has_binary_operator.hpp>

#undef BOOST_TT_TRAIT_NAME
#undef BOOST_TT_TRAIT_OP
#undef BOOST_TT_FORBIDDEN_IF

#endif
