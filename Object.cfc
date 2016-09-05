/*
 * Copyright 2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @author Joel Tobey
 */
component
    displayname="Class Object"
    output="false"
{
    this['equals'] = $equals;

    variables['_instance'] = {};

    public cfboom.lang.Object function init() {
        return this;
    }

    private boolean function $equals(any other) {
        if (!structKeyExists(arguments, "other"))
            return false;
        if (!isInstanceOf(arguments.other, "cfboom.lang.Object"))
            return false;
        if (getIdentityHashCode() == arguments.other.getIdentityHashCode())
            return true;
        return false;
    }

    public numeric function getIdentityHashCode() {
        if (!structKeyExists(variables, "_identityHashCode")) {
            variables['_identityHashCode'] = createObject("java","java.lang.System").identityHashCode(this);
        }
        return _identityHashCode;
    }

    public string function getIdentityString() {
        if (!structKeyExists(variables, "_identityString")) {
            variables['_identityString'] = getComponentName() & "@" & createObject("java","java.lang.Integer").toHexString( getIdentityHashCode() );
        }
        return _identityString;
    }

    public string function getComponentName() {
        if (!structKeyExists(variables, "_componentName")) {
            var meta = getMeta();
            variables['_componentName'] = structKeyExists(meta, "fullname") ? meta.fullname : meta.name;
        }
        return _componentName;
    }

    public struct function getMeta() {
        if (!structKeyExists(variables, "_meta"))
            variables['_meta'] = getMetadata();
        return _meta;
    }

    public numeric function hashCode() {
        return 0;
    }

    public string function toString() {
        return getIdentityString();
    }
}